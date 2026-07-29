import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure SampleSpace where
  domain : Type u
  topology : TopologicalSpace domain
  dimension : Nat
  compactness : Prop
  compactnessClosed : compactness

structure SamplingMethod (S : SampleSpace) where
  sampleCount : Nat
  distribution : Type v
  generateSample : Nat → S.domain → List S.domain
  convergenceProp : Prop
  convergenceClosed : convergenceProp

structure SamplingEvidence {S : SampleSpace} (M : SamplingMethod S) where
  convergenceClosed : M.convergenceProp
  sampleCountPositive : M.sampleCount > 0

def SamplingClosed {S : SampleSpace} (M : SamplingMethod S) : Prop :=
  M.convergenceProp ∧ M.sampleCount > 0

theorem sampling_closed_from_evidence
    {S : SampleSpace} (M : SamplingMethod S) (E : SamplingEvidence M) :
    SamplingClosed M := by
  exact And.intro E.convergenceClosed E.sampleCountPositive

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse