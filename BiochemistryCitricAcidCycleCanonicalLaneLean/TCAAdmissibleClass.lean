import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure TCACycleObject where
  cycleCompleteness : Prop
  energyEfficiency : Prop
  regulatoryBalance : Prop
  conclusion : cycleCompleteness ∧ energyEfficiency ∧ regulatoryBalance

structure AdmissibleClass where
  object : TCACycleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse