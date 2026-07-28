import canonicalLaneMathlib.AdmissibleClass
import BiochemistryCitricAcidCycleCanonicalLaneLean.EnzymeKinetics

namespace HautevilleHouse
namespace BiochemistryCitricAcidCycleCanonicalLaneLean

structure IsocitrateDehydrogenaseRegulationPackage (E : EnzymeKineticsPackage) where
  isocitrateBinding : Prop
  NADPplusBinding : Prop
  oxidativeDecarboxylation : Prop
  allostericActivationByADP : Prop
  allostericInhibitionByNADH : Prop
  thermodynamicDrivingForce : Prop

structure IsocitrateDehydrogenaseRegulationEvidence {E : EnzymeKineticsPackage}
    (I : IsocitrateDehydrogenaseRegulationPackage E) where
  isocitrateBindingClosed : I.isocitrateBinding
  NADPplusBindingClosed : I.NADPplusBinding
  oxidativeDecarboxylationClosed : I.oxidativeDecarboxylation
  allostericActivationByADPClosed : I.allostericActivationByADP
  allostericInhibitionByNADHClosed : I.allostericInhibitionByNADH
  thermodynamicDrivingForceClosed : I.thermodynamicDrivingForce

def IsocitrateDehydrogenaseRegulationClosed {E : EnzymeKineticsPackage}
    (I : IsocitrateDehydrogenaseRegulationPackage E) : Prop :=
  I.isocitrateBinding ∧ I.NADPplusBinding ∧ I.oxidativeDecarboxylation ∧
  I.allostericActivationByADP ∧ I.allostericInhibitionByNADH ∧
  I.thermodynamicDrivingForce

theorem isocitrate_dehydrogenase_regulation_closed_from_evidence
    {E : EnzymeKineticsPackage} (I : IsocitrateDehydrogenaseRegulationPackage E)
    (Ev : IsocitrateDehydrogenaseRegulationEvidence I) :
    IsocitrateDehydrogenaseRegulationClosed I := by
  exact And.intro Ev.isocitrateBindingClosed
    (And.intro Ev.NADPplusBindingClosed
      (And.intro Ev.oxidativeDecarboxylationClosed
        (And.intro Ev.allostericActivationByADPClosed
          (And.intro Ev.allostericInhibitionByNADHClosed
            Ev.thermodynamicDrivingForceClosed))))

end BiochemistryCitricAcidCycleCanonicalLaneLean
end HautevilleHouse