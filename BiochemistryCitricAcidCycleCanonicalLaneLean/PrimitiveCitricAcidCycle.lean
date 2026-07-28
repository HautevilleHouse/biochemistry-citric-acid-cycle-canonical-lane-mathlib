import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure PrimitiveMetabolite where
  name : String
  concentration : Float
  standardGibbsEnergy : Float

defaultInstance : PrimitiveMetabolite := ⟨"", 0.0, 0.0⟩

structure PrimitiveEnzyme where
  name : String
  km : Float
  kcat : Float
  bindingEnergy : Float

defaultInstance : PrimitiveEnzyme := ⟨"", 0.0, 0.0, 0.0⟩

structure PrimitiveReaction where
  substrate : PrimitiveMetabolite
  product : PrimitiveMetabolite
  enzyme : PrimitiveEnzyme
  rateConstant : Float
  equilibriumConstant : Float

defaultInstance : PrimitiveReaction := ⟨defaultInstance, defaultInstance, defaultInstance, 0.0, 0.0⟩

structure PrimitiveCycleState where
  metabolites : List PrimitiveMetabolite
  reactions : List PrimitiveReaction
  cycleComplete : Prop
  energyBalance : Prop

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse