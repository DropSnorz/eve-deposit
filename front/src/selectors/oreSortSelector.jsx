import { createSelector } from 'reselect'

const getSortParameter = (state, props) => state.sortParameter
const getOreList = (state, props) => props.oreList


export const sortOreList = createSelector(
  [ getOreList, getSortParameter ],
  (oreList, sortParameter) => {
    switch (sortParameter) {
      case 'SELL_PRICE':
        return oreList.concat().sort(compareOreSellPrice)
      case 'MINERALS':
        return oreList
      case 'SECURITY':
        return oreList.concat().sort(compareSecurityLevel)
      default:
        return oreList
    }
  }
)


const compareOreSellPrice = (a,b) => {
  return parseFloat(a.normalizedPrice) < parseFloat(b.normalizedPrice)
}
const compareSecurityLevel = (a,b) => {
  return parseFloat(a.securityLevel) < parseFloat(b.securityLevel)
}