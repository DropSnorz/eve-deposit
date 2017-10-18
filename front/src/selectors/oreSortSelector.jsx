import { createSelector } from 'reselect'

const getSortParameter = (state, props) => state.sortParameter
const getOreList = (state, props) => props.oreList
const getMineralFilters = (state, props) => state.mineralFilters


const lightSortOreList = createSelector(
  [ getOreList, getSortParameter ],
  (oreList, sortParameter) =>{
    switch (sortParameter) {
      case 'SELL_PRICE':
        return oreList.concat().sort(compareOreSellPrice)
      case 'SECURITY':
        return oreList.concat().sort(compareSecurityLevel)
      default:
        return oreList
      }
  })


export const sortOreList = createSelector(
  [ lightSortOreList, getSortParameter, getMineralFilters ],
  (oreList, sortParameter, mineralFilters) => {
    switch (sortParameter) {
      case 'MINERALS':
        return oreList.concat().sort(compareOreMinerals(mineralFilters))
      default:
        return oreList
    }
  }
)

const compareOreSellPrice = (a,b) => {
  return parseFloat(a.normalizedPrice) < parseFloat(b.normalizedPrice)
}
const compareOreMinerals = (mineralFilters) => {
  return (a,b) => {
      var resA = 0
      var resB = 0
      for(var i =0; i < mineralFilters.length; i++){
        var mineralFilter = mineralFilters[i];
        for(var j = 0; j < a.reprocessedMinerals.length; j++){
          var reprocess = a.reprocessedMinerals[j]
          if(mineralFilter == reprocess.mineral.id){
            resA = resA + reprocess.reprocessingEfficiency;
          }
        }

        for(var j = 0; j < b.reprocessedMinerals.length; j++){
          var reprocess = b.reprocessedMinerals[j]
          if(mineralFilter == reprocess.mineral.id){
            resB = resB + reprocess.reprocessingEfficiency;
          }
        }
      }
      return resA < resB;

  }
}
const compareSecurityLevel = (a,b) => {
  return parseFloat(a.securityLevel) < parseFloat(b.securityLevel)
}