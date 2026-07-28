import canonicalLaneMathlib.AdmissibleClass
import BiochemistryCitricAcidCycleCanonicalLaneLean.PrimitiveCitricAcidCycle

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CycleProjectionState where
  state : PrimitiveCycleState

def cycleProjection : Projection CycleProjectionState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem cycle_projection_idempotent (x : CycleProjectionState) :
    cycleProjection.toFun (cycleProjection.toFun x) = cycleProjection.toFun x := by
  exact cycleProjection.idempotent x

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse