import HautevilleHouse.BiochemistryCitricAcidCycleCanonicalLaneLean.EnzymeKinetics

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure GibbsFreeEnergyData where
  deltaGStandard : ℝ  -- kJ/mol
  deltaGActual : ℝ
  equilibriumConstant : ℝ

structure ThermodynamicsPackage where
  citrateSynthaseEnergy : GibbsFreeEnergyData
  aconitaseEnergy : GibbsFreeEnergyData
  isocitrateDehydrogenaseEnergy : GibbsFreeEnergyData
  alphaKGDHEnergy : GibbsFreeEnergyData
  succinylCoASynthetaseEnergy : GibbsFreeEnergyData
  succinateDehydrogenaseEnergy : GibbsFreeEnergyData
  fumaraseEnergy : GibbsFreeEnergyData
  malateDehydrogenaseEnergy : GibbsFreeEnergyData
  thermodynamicsConsistent : Prop

structure ThermodynamicsEvidence (T : ThermodynamicsPackage) where
  citrateSynthaseClosed : T.citrateSynthaseEnergy.deltaGActual < 0
  aconitaseClosed : T.aconitaseEnergy.deltaGActual < 0
  isocitrateDehydrogenaseClosed : T.isocitrateDehydrogenaseEnergy.deltaGActual < 0
  alphaKGDHClosed : T.alphaKGDHEnergy.deltaGActual < 0
  succinylCoASynthetaseClosed : T.succinylCoASynthetaseEnergy.deltaGActual < 0
  succinateDehydrogenaseClosed : T.succinateDehydrogenaseEnergy.deltaGActual < 0
  fumaraseClosed : T.fumaraseEnergy.deltaGActual < 0
  malateDehydrogenaseClosed : T.malateDehydrogenaseEnergy.deltaGActual < 0
  thermodynamicsConsistentClosed : T.thermodynamicsConsistent

def ThermodynamicsClosed (T : ThermodynamicsPackage) : Prop :=
  (T.citrateSynthaseEnergy.deltaGActual < 0) ∧
  (T.aconitaseEnergy.deltaGActual < 0) ∧
  (T.isocitrateDehydrogenaseEnergy.deltaGActual < 0) ∧
  (T.alphaKGDHEnergy.deltaGActual < 0) ∧
  (T.succinylCoASynthetaseEnergy.deltaGActual < 0) ∧
  (T.succinateDehydrogenaseEnergy.deltaGActual < 0) ∧
  (T.fumaraseEnergy.deltaGActual < 0) ∧
  (T.malateDehydrogenaseEnergy.deltaGActual < 0) ∧
  T.thermodynamicsConsistent

theorem thermodynamics_closed_from_evidence (T : ThermodynamicsPackage)
    (Ev : ThermodynamicsEvidence T) : ThermodynamicsClosed T :=
  by
    exact And.intro Ev.citrateSynthaseClosed
      (And.intro Ev.aconitaseClosed
        (And.intro Ev.isocitrateDehydrogenaseClosed
          (And.intro Ev.alphaKGDHClosed
            (And.intro Ev.succinylCoASynthetaseClosed
              (And.intro Ev.succinateDehydrogenaseClosed
                (And.intro Ev.fumaraseClosed
                  (And.intro Ev.malateDehydrogenaseClosed Ev.thermodynamicsConsistentClosed)))))))

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse