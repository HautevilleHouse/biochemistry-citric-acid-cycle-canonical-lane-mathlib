import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryCitricAcidCycleCanonicalLaneLean.TCABridgeLemmas
import HautevilleHouse.BiochemistryCitricAcidCycleCanonicalLaneLean.TCAGateLemmas

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

def ConstrainedTCAClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_tca_endgame (A : AdmissibleClass) :
    ConstrainedTCAClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse