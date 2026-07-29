import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativeFreeMethodsMethodsUsingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  bridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DerivativeFreeMethodsMethodsUsingCanonicalLaneLean
end HautevilleHouse