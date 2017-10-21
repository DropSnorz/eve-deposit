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
      case 'SECURITY_LEVEL':
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
  var result = parseFloat(a.normalizedPrice) - parseFloat(b.normalizedPrice)
  if(result < 0) return 1
  else if (result > 0) return -1
  else return 0;

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
      var result = resA - resB;
      if(result < 0) return 1
      else if (result > 0) return -1
      else return 0;

  }
}
const compareSecurityLevel = (a,b) => {
  var result = parseFloat(a.securityLevel) - parseFloat(b.securityLevel)

  if(result < 0) return 1
  else if (result > 0) return -1
  else return 0;

}