import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure SurrogateFunction where
  inputDim : Nat
  outputDim : Nat
  kernelType : Type u
  approximateEval : List ℝ → List ℝ
  accuracyProp : Prop
  accuracyClosed : accuracyProp

structure SurrogateTraining (F : SurrogateFunction) where
  trainingDataSize : Nat
  lossFunction : Type v
  trainedAccuracy : Prop
  trainedAccuracyClosed : trainedAccuracy

def SurrogateClosed (F : SurrogateFunction) : Prop :=
  F.accuracyProp

theorem surrogate_closed_from_training
    (F : SurrogateFunction) (T : SurrogateTraining F) :
    SurrogateClosed F := by
  exact T.trainedAccuracyClosed

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse