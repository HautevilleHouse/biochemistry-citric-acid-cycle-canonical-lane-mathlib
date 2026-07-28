import HautevilleHouse.BiochemistryCitricAcidCycleCanonicalLaneLean.Thermodynamics

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure AllostericRegulation where
  enzyme : String
  activator : String
  inhibitor : String
  atpInhibition : Prop
  nadhInhibition : Prop
  calciumActivation : Prop

structure RegulationPackage where
  citrateSynthaseReg : AllostericRegulation
  isocitrateDehydrogenaseReg : AllostericRegulation
  alphaKGDHReg : AllostericRegulation
  feedbackInhibition : Prop
  energyChargeControl : Prop

structure RegulationEvidence (R : RegulationPackage) where
  citrateSynthaseRegClosed : R.citrateSynthaseReg.atpInhibition ∧ R.citrateSynthaseReg.nadhInhibition
  isocitrateDehydrogenaseRegClosed : R.isocitrateDehydrogenaseReg.atpInhibition ∧ R.isocitrateDehydrogenaseReg.nadhInhibition
  alphaKGDHRegClosed : R.alphaKGDHReg.atpInhibition ∧ R.alphaKGDHReg.nadhInhibition ∧ R.alphaKGDHReg.calciumActivation
  feedbackInhibitionClosed : R.feedbackInhibition
  energyChargeControlClosed : R.energyChargeControl

def RegulationClosed (R : RegulationPackage) : Prop :=
  (R.citrateSynthaseReg.atpInhibition ∧ R.citrateSynthaseReg.nadhInhibition) ∧
  (R.isocitrateDehydrogenaseReg.atpInhibition ∧ R.isocitrateDehydrogenaseReg.nadhInhibition) ∧
  (R.alphaKGDHReg.atpInhibition ∧ R.alphaKGDHReg.nadhInhibition ∧ R.alphaKGDHReg.calciumActivation) ∧
  R.feedbackInhibition ∧ R.energyChargeControl

theorem regulation_closed_from_evidence (R : RegulationPackage)
    (Ev : RegulationEvidence R) : RegulationClosed R :=
  by
    exact And.intro Ev.citrateSynthaseRegClosed
      (And.intro Ev.isocitrateDehydrogenaseRegClosed
        (And.intro Ev.alphaKGDHRegClosed
          (And.intro Ev.feedbackInhibitionClosed Ev.energyChargeControlClosed)))

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse