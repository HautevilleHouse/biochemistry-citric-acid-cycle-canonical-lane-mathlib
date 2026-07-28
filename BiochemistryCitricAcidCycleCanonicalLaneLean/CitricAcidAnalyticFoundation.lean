import canonicalLaneMathlib.AdmissibleClass
import BiochemistryCitricAcidCycleCanonicalLaneLean.PrimitiveCitricAcidCycle

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure ReactionKineticsPackage where
  concentrationDynamics : Prop
  steadyStateExistence : Prop
  perturbationResponse : Prop

structure ReactionKineticsEvidence (R : ReactionKineticsPackage) where
  concentrationDynamicsClosed : R.concentrationDynamics
  steadyStateExistenceClosed : R.steadyStateExistence
  perturbationResponseClosed : R.perturbationResponse

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  R.concentrationDynamics ∧ R.steadyStateExistence ∧ R.perturbationResponse

theorem reaction_kinetics_closed_from_evidence (R : ReactionKineticsPackage) (E : ReactionKineticsEvidence R) :
    ReactionKineticsClosed R := by
  exact And.intro E.concentrationDynamicsClosed (And.intro E.steadyStateExistenceClosed E.perturbationResponseClosed)

structure ThermodynamicsPackage where
  freeEnergyProfile : Prop
  entropyProduction : Prop
  equilibriumConstantDerived : Prop

structure ThermodynamicsEvidence (T : ThermodynamicsPackage) where
  freeEnergyProfileClosed : T.freeEnergyProfile
  entropyProductionClosed : T.entropyProduction
  equilibriumConstantDerivedClosed : T.equilibriumConstantDerived

def ThermodynamicsClosed (T : ThermodynamicsPackage) : Prop :=
  T.freeEnergyProfile ∧ T.entropyProduction ∧ T.equilibriumConstantDerived

theorem thermodynamics_closed_from_evidence (T : ThermodynamicsPackage) (E : ThermodynamicsEvidence T) :
    ThermodynamicsClosed T := by
  exact And.intro E.freeEnergyProfileClosed (And.intro E.entropyProductionClosed E.equilibriumConstantDerivedClosed)

structure CitricAcidAnalyticFoundation where
  kinetics : ReactionKineticsPackage
  kineticsEvidence : ReactionKineticsEvidence kinetics
  thermodynamics : ThermodynamicsPackage
  thermodynamicsEvidence : ThermodynamicsEvidence thermodynamics

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse