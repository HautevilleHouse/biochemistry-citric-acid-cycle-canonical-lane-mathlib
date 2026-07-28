import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure EnzymeKineticsPackage where
  enzyme : Type u
  substrate : Type v
  product : Type w
  km : ℝ
  kcat : ℝ
  michaelisMentenEquation : Prop
  initialVelocity : Prop
  steadyStateAssumption : Prop

structure EnzymeKineticsEvidence (E : EnzymeKineticsPackage) where
  michaelisMentenEquationClosed : E.michaelisMentenEquation
  initialVelocityClosed : E.initialVelocity
  steadyStateAssumptionClosed : E.steadyStateAssumption

def EnzymeKineticsClosed (E : EnzymeKineticsPackage) : Prop :=
  E.michaelisMentenEquation ∧ E.initialVelocity ∧ E.steadyStateAssumption

theorem enzyme_kinetics_closed_from_evidence (E : EnzymeKineticsPackage)
    (Ev : EnzymeKineticsEvidence E) : EnzymeKineticsClosed E := by
  exact And.intro Ev.michaelisMentenEquationClosed
    (And.intro Ev.initialVelocityClosed Ev.steadyStateAssumptionClosed)

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse