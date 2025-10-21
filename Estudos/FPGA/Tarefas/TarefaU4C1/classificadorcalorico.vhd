

library ieee;                                 -- Declara o uso da biblioteca IEEE (padrão em VHDL)
use ieee.std_logic_1164.all;                  -- Importa tipos lógicos como std_logic e std_logic_vector

entity classificadorcalorico is                      -- Início da entidade: define a interface (entradas/saídas)
  port (
    A : in  std_logic;                        -- Entrada A (40%): 1 se ingrediente A presente
    B : in  std_logic;                        -- Entrada B (30%): 1 se ingrediente B presente
    C : in  std_logic;                        -- Entrada C (20%): 1 se ingrediente C presente
    D : in  std_logic;                        -- Entrada D (10%): 1 se ingrediente D presente
    F : out std_logic                         -- Saída F: 1 quando soma > 50%
  );
end entity;                                   -- Fim da definição da interface

architecture rtl of classificadorcalorico is         -- Início da arquitetura (implementação)
begin
  -- Expressão minimizada via Karnaugh:
  -- F = A(B + C) + BCD
  -- Interpretação:
  -- - A(B + C): se A=1 e (B=1 ou C=1), então já passa de 50%
  -- - BCD: sem A, só B+C+D juntos somam 60% (>50%)
  F <= (A and (B or C)) or (B and C and D);   -- Atribuição combinacional da saída F
end architecture;                             -- Fim da arquitetura

