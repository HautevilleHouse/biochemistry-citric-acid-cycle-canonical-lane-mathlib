import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryCitricAcidCycleCanonicalLaneLean.TCAAdmissibleClass

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse