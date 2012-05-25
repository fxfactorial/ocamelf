open ELF_Identification
open Library

let infer_elfclass (bs: bitstring): ei_class =
  bitmatch bs with
  | { ei_class : 8 : int, offset(32), bind(read_ei_class ei_class)
    } -> ei_class

module type ELFCLASS =
sig
  module Identification:
  sig
    type elf_identification
    val read: bitstring -> elf_identification
    val write: elf_identification -> bitstring
    val to_string: elf_identification -> string
  end
  module Ehdr:
  sig
    type elf_ehdr
    val read: Identification.elf_identification -> bitstring -> elf_ehdr
    val to_string: elf_ehdr -> string
  end
end
