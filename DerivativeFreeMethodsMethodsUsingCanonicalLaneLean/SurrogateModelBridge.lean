import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

/-- A structure for surrogate model-based optimization. -/
structure SurrogateModel where
  modelType : String
  designSpace : Type u
  sampleSet : designSpace -> Type v
  surrogatePredictions : Type w
  accuracyGuarantee : Prop

/-- Evidence that the surrogate model satisfies the bridge. -/
structure SurrogateModelEvidence (A : AdmissibleClass) (S : SurrogateModel) where
  accuracyGuaranteeClosed : S.accuracyGuarantee
  bridgeClosed : bridgeClosed A
  gateClosed : gateClosed A

/-- The closure condition for a surrogate model. -/
def SurrogateModelClosure (A : AdmissibleClass) (S : SurrogateModel) : Prop :=
  S.accuracyGuarantee ∧ bridgeClosed A ∧ gateClosed A

/-- The closure from evidence. -/
theorem surrogate_model_closed_from_evidence (A : AdmissibleClass) (S : SurrogateModel)
    (E : SurrogateModelEvidence A S) : SurrogateModelClosure A S :=
  And.intro E.accuracyGuaranteeClosed (And.intro E.bridgeClosed E.gateClosed)

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse