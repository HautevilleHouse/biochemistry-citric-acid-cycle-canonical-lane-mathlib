import BiochemistryCitricAcidCycleCanonicalLaneLean.AdmissibleClass

/-!
# Reaction Kinetics Package for the Citric Acid Cycle
-/

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure ReactionKineticsPackage where
  enzymeConcentration : Prop
  substrateAffinity : Prop
  catalyticRate : Prop
  activationEnergy : Prop
  rateLawValid : Prop

structure ReactionKineticsEvidence (R : ReactionKineticsPackage) where
  enzymeConcentrationClosed : R.enzymeConcentration
  substrateAffinityClosed : R.substrateAffinity
  catalyticRateClosed : R.catalyticRate
  activationEnergyClosed : R.activationEnergy
  rateLawValidClosed : R.rateLawValid

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  R.enzymeConcentration ∧ R.substrateAffinity ∧ R.catalyticRate ∧
  R.activationEnergy ∧ R.rateLawValid

theorem reaction_kinetics_closed_from_evidence (R : ReactionKineticsPackage)
    (E : ReactionKineticsEvidence R) : ReactionKineticsClosed R := by
  exact And.intro E.enzymeConcentrationClosed
    (And.intro E.substrateAffinityClosed
      (And.intro E.catalyticRateClosed
        (And.intro E.activationEnergyClosed E.rateLawValidClosed)))

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse