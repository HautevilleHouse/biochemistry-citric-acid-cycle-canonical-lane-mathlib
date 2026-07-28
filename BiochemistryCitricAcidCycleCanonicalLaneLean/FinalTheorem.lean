import canonicalLaneMathlib.AdmissibleClass
import BiochemistryCitricAcidCycleCanonicalLaneLean.BridgeLemmas
import BiochemistryCitricAcidCycleCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

def ConstrainedCitricAcidCycleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_citric_acid_cycle_endgame (A : AdmissibleClass) :
    ConstrainedCitricAcidCycleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse