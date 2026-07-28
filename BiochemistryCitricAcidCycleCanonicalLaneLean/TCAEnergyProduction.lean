import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryCitricAcidCycleCanonicalLaneLean.TCAMetabolicFlux

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure EnergyProductionPackage {E : EnzymeKineticsPackage}
    (F : MetabolicFluxPackage E) where
  atpYield : Prop
  nadhYield : Prop
  fadh2Yield : Prop
  energeticsEfficiency : Prop

structure EnergyProductionEvidence {E : EnzymeKineticsPackage}
    {F : MetabolicFluxPackage E} (P : EnergyProductionPackage F) where
  atpYieldClosed : P.atpYield
  nadhYieldClosed : P.nadhYield
  fadh2YieldClosed : P.fadh2Yield
  energeticsEfficiencyClosed : P.energeticsEfficiency

def EnergyProductionClosed {E : EnzymeKineticsPackage}
    {F : MetabolicFluxPackage E} (P : EnergyProductionPackage F) : Prop :=
  P.atpYield ∧ P.nadhYield ∧ P.fadh2Yield ∧ P.energeticsEfficiency

theorem energy_production_closed_from_evidence {E : EnzymeKineticsPackage}
    {F : MetabolicFluxPackage E} (P : EnergyProductionPackage F)
    (Ev : EnergyProductionEvidence P) : EnergyProductionClosed P := by
  exact And.intro Ev.atpYieldClosed
    (And.intro Ev.nadhYieldClosed
      (And.intro Ev.fadh2YieldClosed Ev.energeticsEfficiencyClosed))

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse