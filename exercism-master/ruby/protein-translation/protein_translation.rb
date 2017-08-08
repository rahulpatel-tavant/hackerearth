# Protein Translation in Ruby
class Translation
  PROTEIN = { 'Methionine' => %w(AUG), 'Phenylalanine' => %w(UUU UUC),
              'Leucine' => %w(UUA UUG), 'Serine' => %w(UCU UCC UCA UCG),
              'Tyrosine' => %w(UAU UAC), 'Cysteine' => %w(UGU UGC),
              'Tryptophan' => %w(UGG), 'STOP' => %w(UAA UAG UGA)
            }.freeze

  def self.of_codon(codon)
    PROTEIN.each do |protein_name, codon_name|
      return protein_name if codon_name.include?(codon)
    end
    raise InvalidCodonError
  end

  def self.of_rna(strand)
    proteins = []
    strand.scan(/.{1,3}/).each do |codon|
      break if of_codon(codon) == 'STOP'
      proteins << of_codon(codon)
    end
    proteins
  end
end
InvalidCodonError = Class.new(StandardError)
