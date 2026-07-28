import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure ReviewerBridgeFile where
  path : String
  role : String
  sha256 : String
  present : Bool
deriving Repr, DecidableEq

structure ReviewerClosureGate where
  gate : String
  constant : String
deriving Repr, DecidableEq

def reviewerBridgeFiles : List ReviewerBridgeFile := [
  { path := "REVIEWER_MAP.md", role := "reviewer_map", sha256 := "abc123", present := true },
  { path := "constants/citric_acid_constants.json", role := "constant_inputs", sha256 := "def456", present := true }
]

def reviewerClosureGates : List ReviewerClosureGate := [
  { gate := "CAC_G1", constant := "citrate_synthase_rate" },
  { gate := "CAC_G2", constant := "isocitrate_dehydrogenase_rate" },
  { gate := "CAC_G3", constant := "alpha_ketoglutarate_rate" },
  { gate := "CAC_G4", constant := "succinyl_coa_rate" },
  { gate := "CAC_G5", constant := "succinate_dehydrogenase_rate" },
  { gate := "CAC_G6", constant := "malate_dehydrogenase_rate" }
]

theorem reviewer_bridge_constant_count_checked : reviewerClosureGates.length = 6 := by rfl

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse