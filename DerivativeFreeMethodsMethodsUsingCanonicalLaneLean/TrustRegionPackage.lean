import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure TrustRegionPackage where
  radiusUpdate : Prop
  modelConstruction : Prop
  acceptanceCriterion : Prop
  complexityGuarantee : Prop

structure TrustRegionEvidence (T : TrustRegionPackage) where
  radiusUpdateClosed : T.radiusUpdate
  modelConstructionClosed : T.modelConstruction
  acceptanceCriterionClosed : T.acceptanceCriterion
  complexityGuaranteeClosed : T.complexityGuarantee

def TrustRegionClosed (T : TrustRegionPackage) : Prop :=
  T.radiusUpdate ∧ T.modelConstruction ∧ T.acceptanceCriterion ∧ T.complexityGuarantee

theorem trust_region_closed_from_evidence (T : TrustRegionPackage)
    (E : TrustRegionEvidence T) : TrustRegionClosed T := by
  exact And.intro E.radiusUpdateClosed
    (And.intro E.modelConstructionClosed
      (And.intro E.acceptanceCriterionClosed E.complexityGuaranteeClosed))

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse
