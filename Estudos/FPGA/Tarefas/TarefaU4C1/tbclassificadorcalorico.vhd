library ieee;                                 -- Biblioteca padrão
use ieee.std_logic_1164.all;                  -- Tipos lógicos
use ieee.numeric_std.all;                     -- Funções aritméticas (to_unsigned) para gerar estímulos

entity tbclassificadorcalorico is                   -- Entidade de testbench (sem portas externas)
end entity;                                   -- Testbench não expõe interface

architecture sim of tbclassificadorcalorico is      -- Início da arquitetura de simulação
  signal A, B, C, D, F : std_logic := '0';    -- Sinais internos que conectam ao DUT (Device Under Test)

  -- Função de referência: mesma lógica da especificação para checagem automática
  function ref(A, B, C, D : std_logic) return std_logic is
  begin
    -- Retorna '1' se condição >50% é atendida
    if (A='1' and (B='1' or C='1')) or (B='1' and C='1' and D='1') then
      return '1';
    else
      return '0';
    end if;
  end function;                               -- Fim da função de referência

begin
  -- Instancia o DUT (Device Under Test) usando a arquitetura rtl do módulo light_calorias
  dut: entity work.light_calorias(rtl)
    port map (
      A => A,                                 -- Mapeia sinal de teste A para a porta A do DUT
      B => B,                                 -- Mapeia B
      C => C,                                 -- Mapeia C
      D => D,                                 -- Mapeia D
      F => F                                  -- Captura a saída F do DUT
    );

  -- Processo gerador de estímulos e verificador
  stim: process
    variable v : std_logic_vector(3 downto 0);-- Variável para iterar valores binários de 0000 a 1111
  begin
    for i in 0 to 15 loop                     -- Varrendo todas as 16 combinações de A,B,C,D
      v := std_logic_vector(to_unsigned(i, 4)); -- Converte i (inteiro) para vetor de 4 bits
      A <= v(3);                              -- Bit mais significativo vai para A
      B <= v(2);                              -- Próximo bit vai para B
      C <= v(1);                              -- Próximo bit vai para C
      D <= v(0);                              -- Bit menos significativo vai para D
      wait for 10 ns;                         -- Aguarda propagação e estabilização do DUT

      -- Verifica automaticamente se a saída do DUT bate com a função de referência
      assert F = ref(A,B,C,D)
        report "Falha em A,B,C,D="            -- Mensagem de erro (concatena os valores atuais)
               & std_logic'image(A)
               & std_logic'image(B)
               & std_logic'image(C)
               & std_logic'image(D)
        severity error;                        -- Classifica como erro para facilitar a detecção
    end loop;                                  -- Fim da varredura de todas as combinações

    report "Teste concluido." severity note;   -- Mensagem de sucesso ao final
    wait;                                      -- Mantém a simulação aberta (sem encerrar)
  end process;                                 -- Fim do processo de estímulos
end architecture;                              -- Fim da arquitetura de simulação
