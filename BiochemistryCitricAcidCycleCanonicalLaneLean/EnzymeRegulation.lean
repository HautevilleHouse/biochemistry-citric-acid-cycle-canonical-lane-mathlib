import BiochemistryCitricAcidCycleCanonicalLaneLean.ReactionKinetics

/-!
# Enzyme Regulation Package for the Citric Acid Cycle
-/

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure EnzymeRegulationPackage where
  allostericInhibition : Prop
  feedbackLoops : Prop
  covalentModification : Prop
  substrateCycling : Prop
  compartmentalization : Prop

structure EnzymeRegulationEvidence (R : EnzymeRegulationPackage) where
  allostericInhibitionClosed : R.allostericInhibition
  feedbackLoopsClosed : R.feedbackLoops
  covalentModificationClosed : R.covalentModification
  substrateCyclingClosed : R.substrateCycling
  compartmentalizationClosed : R.compartmentalization

def EnzymeRegulationClosed (R : EnzymeRegulationPackage) : Prop :=
  R.allostericInhibition ∧ R.feedbackLoops ∧ R.covalentModification ∧
  R.substrateCycling ∧ R.compartmentalization

theorem enzyme_regulation_closed_from_evidence (R : EnzymeRegulationPackage)
    (E : EnzymeRegulationEvidence R) : EnzymeRegulationClosed R := by
  exact And.intro E.allostericInhibitionClosed
    (And.intro E.feedbackLoopsClosed
      (And.intro E.covalentModificationClosed
        (And.intro E.substrateCyclingClosed E.compartmentalizationClosed)))

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse