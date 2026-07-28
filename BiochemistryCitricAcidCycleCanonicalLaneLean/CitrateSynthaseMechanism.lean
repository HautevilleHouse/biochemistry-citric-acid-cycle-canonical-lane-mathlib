import canonicalLaneMathlib.AdmissibleClass
import BiochemistryCitricAcidCycleCanonicalLaneLean.EnzymeKinetics

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure CitrateSynthaseMechanismPackage (E : EnzymeKineticsPackage) where
  oxaloacetateBinding : Prop
  acetylCoABinding : Prop
  condensationReaction : Prop
  productRelease : Prop
  regulationByATP : Prop

structure CitrateSynthaseMechanismEvidence {E : EnzymeKineticsPackage}
    (C : CitrateSynthaseMechanismPackage E) where
  oxaloacetateBindingClosed : C.oxaloacetateBinding
  acetylCoABindingClosed : C.acetylCoABinding
  condensationReactionClosed : C.condensationReaction
  productReleaseClosed : C.productRelease
  regulationByATPClosed : C.regulationByATP

def CitrateSynthaseMechanismClosed {E : EnzymeKineticsPackage}
    (C : CitrateSynthaseMechanismPackage E) : Prop :=
  C.oxaloacetateBinding ∧ C.acetylCoABinding ∧ C.condensationReaction ∧
  C.productRelease ∧ C.regulationByATP

theorem citrate_synthase_mechanism_closed_from_evidence
    {E : EnzymeKineticsPackage} (C : CitrateSynthaseMechanismPackage E)
    (Ev : CitrateSynthaseMechanismEvidence C) : CitrateSynthaseMechanismClosed C := by
  exact And.intro Ev.oxaloacetateBindingClosed
    (And.intro Ev.acetylCoABindingClosed
      (And.intro Ev.condensationReactionClosed
        (And.intro Ev.productReleaseClosed Ev.regulationByATPClosed)))

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse