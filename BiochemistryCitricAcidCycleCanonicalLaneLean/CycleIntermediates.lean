import HautevilleHouse.BiochemistryCitricAcidCycleCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure CitricAcidCycleIntermediates where
  citrate : Prop
  isocitrate : Prop
  alphaKetoglutarate : Prop
  succinylCoA : Prop
  succinate : Prop
  fumarate : Prop
  malate : Prop
  oxaloacetate : Prop

structure IntermediatesEvidence (I : CitricAcidCycleIntermediates) where
  citrateClosed : I.citrate
  isocitrateClosed : I.isocitrate
  alphaKetoglutarateClosed : I.alphaKetoglutarate
  succinylCoAClosed : I.succinylCoA
  succinateClosed : I.succinate
  fumarateClosed : I.fumarate
  malateClosed : I.malate
  oxaloacetateClosed : I.oxaloacetate

def IntermediatesClosed (I : CitricAcidCycleIntermediates) : Prop :=
  I.citrate ∧ I.isocitrate ∧ I.alphaKetoglutarate ∧ I.succinylCoA ∧
  I.succinate ∧ I.fumarate ∧ I.malate ∧ I.oxaloacetate

theorem intermediates_closed_from_evidence (I : CitricAcidCycleIntermediates)
    (E : IntermediatesEvidence I) : IntermediatesClosed I :=
  by
    exact And.intro E.citrateClosed (And.intro E.isocitrateClosed
      (And.intro E.alphaKetoglutarateClosed (And.intro E.succinylCoAClosed
        (And.intro E.succinateClosed (And.intro E.fumarateClosed
          (And.intro E.malateClosed E.oxaloacetateClosed))))))

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse