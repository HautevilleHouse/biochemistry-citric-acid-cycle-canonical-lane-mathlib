import canonicalLaneMathlib.AdmissibleClass
import BiochemistryCitricAcidCycleCanonicalLaneLean.PrimitiveCitricAcidCycle

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure ReactionKineticsPDEPackage where
  concentrationField : Type u
  diffusionCoefficient : Float
  reactionRates : List Float
  initialCondition : Prop
  boundaryCondition : Prop

defaultInstance : ReactionKineticsPDEPackage := ⟨Unit, 0.0, [], trivial, trivial⟩

structure ReactionKineticsPDEEvidence (P : ReactionKineticsPDEPackage) where
  initialConditionClosed : P.initialCondition
  boundaryConditionClosed : P.boundaryCondition

def ReactionKineticsPDEClosed (P : ReactionKineticsPDEPackage) : Prop :=
  P.initialCondition ∧ P.boundaryCondition

theorem reaction_kinetics_pde_closed_from_evidence (P : ReactionKineticsPDEPackage) (E : ReactionKineticsPDEEvidence P) :
    ReactionKineticsPDEClosed P := by
  exact And.intro E.initialConditionClosed E.boundaryConditionClosed

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse