import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure SimplexReflectionPackage where
  verticesCount : Nat
  reflectionCoefficient : Float
  expansionCoefficient : Float
  contractionCoefficient : Float
  shrinkCoefficient : Float
  convergenceTest : Prop

structure SimplexReflectionEvidence (S : SimplexReflectionPackage) where
  verticesCountClosed : S.verticesCount ≥ 2
  reflectionCoefficientClosed : S.reflectionCoefficient > 0.0
  expansionCoefficientClosed : S.expansionCoefficient > 1.0
  contractionCoefficientClosed : 0.0 < S.contractionCoefficient ∧ S.contractionCoefficient < 1.0
  shrinkCoefficientClosed : 0.0 < S.shrinkCoefficient ∧ S.shrinkCoefficient < 1.0
  convergenceTestClosed : S.convergenceTest

def SimplexReflectionClosed (S : SimplexReflectionPackage) : Prop :=
  S.verticesCount ≥ 2 ∧
  S.reflectionCoefficient > 0.0 ∧
  S.expansionCoefficient > 1.0 ∧
  (0.0 < S.contractionCoefficient ∧ S.contractionCoefficient < 1.0) ∧
  (0.0 < S.shrinkCoefficient ∧ S.shrinkCoefficient < 1.0) ∧
  S.convergenceTest

theorem simplex_reflection_closed_from_evidence (S : SimplexReflectionPackage) (E : SimplexReflectionEvidence S) :
    SimplexReflectionClosed S := by
  exact And.intro E.verticesCountClosed
    (And.intro E.reflectionCoefficientClosed
      (And.intro E.expansionCoefficientClosed
        (And.intro E.contractionCoefficientClosed
          (And.intro E.shrinkCoefficientClosed E.convergenceTestClosed))))

end HautevilleHouse
end HautevilleHouse