import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryCitricAcidCycleCanonicalLaneLean.TCAEnzymeKinetics

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure MetabolicFluxPackage (E : EnzymeKineticsPackage) where
  fluxBalance : Prop
  netCarbonInput : Prop
  intermediateConcentrations : Prop
  cycleTurnoverRate : Prop

structure MetabolicFluxEvidence {E : EnzymeKineticsPackage}
    (F : MetabolicFluxPackage E) where
  fluxBalanceClosed : F.fluxBalance
  netCarbonInputClosed : F.netCarbonInput
  intermediateConcentrationsClosed : F.intermediateConcentrations
  cycleTurnoverRateClosed : F.cycleTurnoverRate

def MetabolicFluxClosed {E : EnzymeKineticsPackage}
    (F : MetabolicFluxPackage E) : Prop :=
  F.fluxBalance ∧ F.netCarbonInput ∧ F.intermediateConcentrations ∧ F.cycleTurnoverRate

theorem metabolic_flux_closed_from_evidence {E : EnzymeKineticsPackage}
    (F : MetabolicFluxPackage E) (Ev : MetabolicFluxEvidence F) :
    MetabolicFluxClosed F := by
  exact And.intro Ev.fluxBalanceClosed
    (And.intro Ev.netCarbonInputClosed
      (And.intro Ev.intermediateConcentrationsClosed Ev.cycleTurnoverRateClosed))

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse