import canonicalLaneMathlib.AdmissibleClass
import BiochemistryCitricAcidCycleCanonicalLaneLean.EnzymeKinetics
import BiochemistryCitricAcidCycleCanonicalLaneLean.CitrateSynthaseMechanism

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure MetabolicFluxAnalysisPackage (E : EnzymeKineticsPackage)
    (C : CitrateSynthaseMechanismPackage E) where
  netFluxCalculation : Prop
  cycleIntermediateConcentrations : Prop
  energyYield : Prop
  regulationPointsIdentified : Prop
  anapleroticReactions : Prop

structure MetabolicFluxAnalysisEvidence {E : EnzymeKineticsPackage}
    {C : CitrateSynthaseMechanismPackage E}
    (M : MetabolicFluxAnalysisPackage E C) where
  netFluxCalculationClosed : M.netFluxCalculation
  cycleIntermediateConcentrationsClosed : M.cycleIntermediateConcentrations
  energyYieldClosed : M.energyYield
  regulationPointsIdentifiedClosed : M.regulationPointsIdentified
  anapleroticReactionsClosed : M.anapleroticReactions

def MetabolicFluxAnalysisClosed {E : EnzymeKineticsPackage}
    {C : CitrateSynthaseMechanismPackage E}
    (M : MetabolicFluxAnalysisPackage E C) : Prop :=
  M.netFluxCalculation ∧ M.cycleIntermediateConcentrations ∧ M.energyYield ∧
  M.regulationPointsIdentified ∧ M.anapleroticReactions

theorem metabolic_flux_analysis_closed_from_evidence
    {E : EnzymeKineticsPackage} {C : CitrateSynthaseMechanismPackage E}
    (M : MetabolicFluxAnalysisPackage E C)
    (Ev : MetabolicFluxAnalysisEvidence M) : MetabolicFluxAnalysisClosed M := by
  exact And.intro Ev.netFluxCalculationClosed
    (And.intro Ev.cycleIntermediateConcentrationsClosed
      (And.intro Ev.energyYieldClosed
        (And.intro Ev.regulationPointsIdentifiedClosed
          Ev.anapleroticReactionsClosed)))

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse