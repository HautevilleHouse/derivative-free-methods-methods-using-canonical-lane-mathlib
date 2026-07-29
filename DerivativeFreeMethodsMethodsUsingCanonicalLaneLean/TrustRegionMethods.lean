import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure TrustRegionMethodsPackage where
  trustRegionRadius : Type u
  modelReduction : Type v
  acceptanceCriterion : Type w
  globalConvergence : Prop
  localConvergenceRate : Prop
  radiusUpdateRule : Prop

structure TrustRegionMethodsEvidence (T : TrustRegionMethodsPackage) where
  globalConvergenceClosed : T.globalConvergence
  localConvergenceRateClosed : T.localConvergenceRate
  radiusUpdateRuleClosed : T.radiusUpdateRule

def TrustRegionMethodsClosed (T : TrustRegionMethodsPackage) : Prop :=
  T.globalConvergence ∧ T.localConvergenceRate ∧ T.radiusUpdateRule

theorem trust_region_methods_closed_from_evidence
    (T : TrustRegionMethodsPackage) (E : TrustRegionMethodsEvidence T) :
    TrustRegionMethodsClosed T := by
  exact And.intro E.globalConvergenceClosed
    (And.intro E.localConvergenceRateClosed E.radiusUpdateRuleClosed)

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse