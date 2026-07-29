import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DerivativeFreeMethodsCanonicalLaneLean.ProblemFormulation

namespace HautevilleHouse
namespace DerivativeFreeMethodsCanonicalLaneLean

structure TrustRegionModel where
  modelType : String
  radius : Float
  interpolationSet : Nat
  qualityGuarantee : Prop

structure TrustRegionPackage (P : DerivativeFreeProblem) where
  model : TrustRegionModel
  stepAccepted : Prop
  radiusUpdated : Prop
  convergenceProof : Prop

structure TrustRegionEvidence {P : DerivativeFreeProblem}
    (T : TrustRegionPackage P) where
  modelQualityGuaranteed : T.model.qualityGuarantee
  stepAcceptedClosed : T.stepAccepted
  radiusUpdatedClosed : T.radiusUpdated
  convergenceProofClosed : T.convergenceProof

def TrustRegionClosed {P : DerivativeFreeProblem}
    (T : TrustRegionPackage P) : Prop :=
  T.model.qualityGuarantee ∧ T.stepAccepted ∧
  T.radiusUpdated ∧ T.convergenceProof

theorem trust_region_closed_from_evidence {P : DerivativeFreeProblem}
    (T : TrustRegionPackage P) (E : TrustRegionEvidence T) :
    TrustRegionClosed T := by
  exact And.intro E.modelQualityGuaranteed (And.intro E.stepAcceptedClosed
    (And.intro E.radiusUpdatedClosed E.convergenceProofClosed))

end DerivativeFreeMethodsCanonicalLaneLean
end HautevilleHouse
