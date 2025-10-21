-- RESIDÊNCIA PROFISSIONAL EM FPGA
-- EmbarcaTech IFMA MTC
-- Discente: Renato da Fonseca Oliveira
-- VHDL: Máquinas de Estados e Bibliotecas.

library ieee;
use ieee.std_logic_1164.all;

package porta_local_pkg is
    -- tipos compartilhados pelo projeto (enum dos estados)
    type t_estado is (FECHADA, ABRINDO, ABERTA, FECHANDO);
end package porta_local_pkg;