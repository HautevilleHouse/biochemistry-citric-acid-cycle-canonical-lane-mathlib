import BiochemistryCitricAcidCycleCanonicalLaneLean.EnzymeRegulation

/-!
# Thermodynamic Driving Force Package for the Citric Acid Cycle
-/

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure ThermodynamicDrivingForcePackage where
  gibbsFreeEnergyChange : Prop
  equilibriumConstant : Prop
  reactionSpontaneity : Prop
  coupledReactions : Prop
  pHDependence : Prop

structure ThermodynamicDrivingForceEvidence (T : ThermodynamicDrivingForcePackage) where
  gibbsFreeEnergyChangeClosed : T.gibbsFreeEnergyChange
  equilibriumConstantClosed : T.equilibriumConstant
  reactionSpontaneityClosed : T.reactionSpontaneity
  coupledReactionsClosed : T.coupledReactions
  pHDependenceClosed : T.pHDependence

def ThermodynamicDrivingForceClosed (T : ThermodynamicDrivingForcePackage) : Prop :=
  T.gibbsFreeEnergyChange ∧ T.equilibriumConstant ∧ T.reactionSpontaneity ∧
  T.coupledReactions ∧ T.pHDependence

theorem thermodynamic_driving_force_closed_from_evidence
    (T : ThermodynamicDrivingForcePackage) (E : ThermodynamicDrivingForceEvidence T) :
    ThermodynamicDrivingForceClosed T := by
  exact And.intro E.gibbsFreeEnergyChangeClosed
    (And.intro E.equilibriumConstantClosed
      (And.intro E.reactionSpontaneityClosed
        (And.intro E.coupledReactionsClosed E.pHDependenceClosed)))

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse