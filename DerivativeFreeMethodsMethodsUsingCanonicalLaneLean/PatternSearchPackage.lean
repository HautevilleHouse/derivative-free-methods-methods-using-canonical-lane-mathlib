import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

structure PatternSearchPackage where
  pollMethod : String
  contractExpansion : Float
  meshSize : Float
  parameterSpaceDimension : Nat
  terminationCondition : Prop

structure PatternSearchEvidence (P : PatternSearchPackage) where
  pollMethodClosed : P.pollMethod = "generalizedPatternSearch"
  contractExpansionClosed : P.contractExpansion > 0.0
  meshSizeClosed : P.meshSize > 0.0
  parameterSpaceDimensionClosed : P.parameterSpaceDimension > 0
  terminationConditionClosed : P.terminationCondition

def PatternSearchClosed (P : PatternSearchPackage) : Prop :=
  P.pollMethod = "generalizedPatternSearch" ∧
  P.contractExpansion > 0.0 ∧
  P.meshSize > 0.0 ∧
  P.parameterSpaceDimension > 0 ∧
  P.terminationCondition

theorem pattern_search_closed_from_evidence (P : PatternSearchPackage) (E : PatternSearchEvidence P) :
    PatternSearchClosed P := by
  exact And.intro E.pollMethodClosed
    (And.intro E.contractExpansionClosed
      (And.intro E.meshSizeClosed
        (And.intro E.parameterSpaceDimensionClosed E.terminationConditionClosed)))

end HautevilleHouse
end HautevilleHouse