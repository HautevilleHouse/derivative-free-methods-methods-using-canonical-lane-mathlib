import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure ImplicitFilteringPackage where
  stencilSize : Nat
  stepSizeSequence : List Float
  smoothingTechnique : String
  noiseModel : String
  stochasticAwareness : Prop

structure ImplicitFilteringEvidence (I : ImplicitFilteringPackage) where
  stencilSizeClosed : I.stencilSize ≥ 3
  stepSizeSequenceClosed : I.stepSizeSequence ≠ []
  smoothingTechniqueClosed : I.smoothingTechnique = "polynomial"
  noiseModelClosed : I.noiseModel ∈ ["additive", "multiplicative"]
  stochasticAwarenessClosed : I.stochasticAwareness

def ImplicitFilteringClosed (I : ImplicitFilteringPackage) : Prop :=
  I.stencilSize ≥ 3 ∧
  I.stepSizeSequence ≠ [] ∧
  I.smoothingTechnique = "polynomial" ∧
  (I.noiseModel = "additive" ∨ I.noiseModel = "multiplicative") ∧
  I.stochasticAwareness

theorem implicit_filtering_closed_from_evidence (I : ImplicitFilteringPackage) (E : ImplicitFilteringEvidence I) :
    ImplicitFilteringClosed I := by
  exact And.intro E.stencilSizeClosed
    (And.intro E.stepSizeSequenceClosed
      (And.intro E.smoothingTechniqueClosed
        (And.intro E.noiseModelClosed E.stochasticAwarenessClosed)))

end HautevilleHouse
end HautevilleHouse