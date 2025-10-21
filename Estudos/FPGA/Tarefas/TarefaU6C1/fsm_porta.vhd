-- RESIDÊNCIA PROFISSIONAL EM FPGA
-- EmbarcaTech IFMA MTC
-- Discente: Renato da Fonseca Oliveira
-- VHDL: Máquinas de Estados e Bibliotecas.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Removido pacote local daqui; agora usamos o pacote externo porta_local_pkg
use work.porta_local_pkg.all;

entity fsm_porta is
    generic (
        CLK_FREQUENCY       : natural := 50_000_000;
        T_ABERTA_SEGUNDOS   : natural := 5
    );
    port (
        clk              : in  std_logic;
        rst_n            : in  std_logic;  -- reset ativo-baixo
        sensor           : in  std_logic;  -- sensor de presença (dispara a abertura)
        fechar_manual    : in  std_logic;  -- comando manual para fechar
        fim_curso_aberta : in  std_logic;  -- fim de curso: totalmente aberta
        fim_curso_fechada: in  std_logic;  -- fim de curso: totalmente fechada
        motor_abrir      : out std_logic;  -- acionamento do motor de abrir (ativo em nível alto)
        motor_fechar     : out std_logic;  -- acionamento do motor de fechar (ativo em nível alto)
        debug_estado     : out t_estado     -- saída de depuração
    );
end entity fsm_porta;

architecture rtl of fsm_porta is
    -- Registradores do estado atual e do próximo estado para a FSM
    signal estado_atual, proximo_estado : t_estado;

    -- Contagem máxima para o temporizador de "aberta".
    constant MAX_CONTAGEM : natural := CLK_FREQUENCY * T_ABERTA_SEGUNDOS;

    -- Contador usado como temporizador no estado ABERTA.
    signal contador : natural range 0 to MAX_CONTAGEM := 0;

    -- Flag combinacional indicando que o temporizador expirou.
    signal timer_expirou : std_logic;
begin
    -- Expõe o estado interno para depuração/monitoramento
    debug_estado <= estado_atual;

    -- Processo síncrono: registro de estado e atualização do temporizador.
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            estado_atual <= FECHADA;
            contador     <= 0;
        elsif rising_edge(clk) then
            estado_atual <= proximo_estado;

            -- Conta apenas enquanto o estado atual (após atualização) for ABERTA.
            if proximo_estado = ABERTA then
                -- Se o sensor detectar presença reinicia o contador para manter a porta aberta.
                -- Se atingir MAX_CONTAGEM também reinicia (timer_expirou é observado pela lógica).
                if sensor = '1' or contador = MAX_CONTAGEM then
                    contador <= 0;
                else
                    contador <= contador + 1;
                end if;
            else
                contador <= 0;
            end if;
        end if;
    end process;

    -- Sinal combinacional quando o contador atingiu o máximo
    timer_expirou <= '1' when contador = MAX_CONTAGEM else '0';

    -- Lógica combinacional de próximo estado
    process(estado_atual, sensor, fechar_manual, fim_curso_aberta, fim_curso_fechada, timer_expirou)
    begin
        proximo_estado <= estado_atual;

        case estado_atual is
            when FECHADA =>
                if sensor = '1' then
                    proximo_estado <= ABRINDO;
                end if;
            when ABRINDO =>
                if fim_curso_aberta = '1' then
                    proximo_estado <= ABERTA;
                end if;
            when ABERTA =>
                if (timer_expirou = '1' and sensor = '0') or (fechar_manual = '1') then
                    proximo_estado <= FECHANDO;
                end if;
            when FECHANDO =>
                if fim_curso_fechada = '1' then
                    proximo_estado <= FECHADA;
                end if;
        end case;
    end process;

    -- Lógica de saída: aciona motores conforme o estado atual
    process(estado_atual)
    begin
        motor_abrir  <= '0';
        motor_fechar <= '0';
        case estado_atual is
            when ABRINDO  => motor_abrir  <= '1';
            when FECHANDO => motor_fechar <= '1';
            when others   => null;
        end case;
    end process;
end architecture rtl;