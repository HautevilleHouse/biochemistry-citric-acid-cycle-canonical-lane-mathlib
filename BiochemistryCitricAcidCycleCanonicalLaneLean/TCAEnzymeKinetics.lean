import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryCitricAcidCycleCanonicalLaneLean.TCAAdmissibleClass

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure EnzymeKineticsPackage where
  substrateAffinity : Prop
  catalyticRate : Prop
  regulationByProducts : Prop
  allostericControl : Prop

structure EnzymeKineticsEvidence (E : EnzymeKineticsPackage) where
  substrateAffinityClosed : E.substrateAffinity
  catalyticRateClosed : E.catalyticRate
  regulationByProductsClosed : E.regulationByProducts
  allostericControlClosed : E.allostericControl

def EnzymeKineticsClosed (E : EnzymeKineticsPackage) : Prop :=
  E.substrateAffinity ∧ E.catalyticRate ∧ E.regulationByProducts ∧ E.allostericControl

theorem enzyme_kinetics_closed_from_evidence (E : EnzymeKineticsPackage)
    (Ev : EnzymeKineticsEvidence E) : EnzymeKineticsClosed E := by
  exact And.intro Ev.substrateAffinityClosed
    (And.intro Ev.catalyticRateClosed
      (And.intro Ev.regulationByProductsClosed Ev.allostericControlClosed))

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse