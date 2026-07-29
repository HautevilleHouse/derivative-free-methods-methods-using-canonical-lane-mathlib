import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure ModelBasedTrustRegionPackage where
  surrogateModelType : String
  trustRegionRadius : Float
  improvementRatio : Float
  acceptanceThreshold : Float
  modelAccuracy : Prop

structure ModelBasedTrustRegionEvidence (M : ModelBasedTrustRegionPackage) where
  surrogateModelTypeClosed : M.surrogateModelType = "quadratic"
  trustRegionRadiusClosed : M.trustRegionRadius > 0.0
  improvementRatioClosed : M.improvementRatio ≥ 0.0
  acceptanceThresholdClosed : M.acceptanceThreshold > 0.0
  modelAccuracyClosed : M.modelAccuracy

def ModelBasedTrustRegionClosed (M : ModelBasedTrustRegionPackage) : Prop :=
  M.surrogateModelType = "quadratic" ∧
  M.trustRegionRadius > 0.0 ∧
  M.improvementRatio ≥ 0.0 ∧
  M.acceptanceThreshold > 0.0 ∧
  M.modelAccuracy

theorem model_based_trust_region_closed_from_evidence (M : ModelBasedTrustRegionPackage) (E : ModelBasedTrustRegionEvidence M) :
    ModelBasedTrustRegionClosed M := by
  exact And.intro E.surrogateModelTypeClosed
    (And.intro E.trustRegionRadiusClosed
      (And.intro E.improvementRatioClosed
        (And.intro E.acceptanceThresholdClosed E.modelAccuracyClosed)))

end HautevilleHouse
end HautevilleHouse