import { connect } from 'react-redux'
import OreList from '../components/OreList.jsx'

const getVisibleOreList = (oreList, state) => {
    
  var nameFilters = state.oreNameVisibilityFilter;
  var securityLevelFilter = state.oreSecurityLevelFilter;
  var mineralFilters = state.mineralFilters;

  var filteredOre = oreList;

  if(nameFilters.length > 0 && nameFilters[0] != ""){
    filteredOre  = oreList.filter(function(oreItem){
     return nameFilters.filter(function(oreFilter){
        return oreItem.name == oreFilter;
     }).length != 0
  	});
  }

  if(securityLevelFilter!="ALL"){
    filteredOre = filteredOre.filter(function(oreItem){
      if(securityLevelFilter=="HIGH_SEC"){
        return oreItem.securityLevel > 0.4
      }
      if(securityLevelFilter=="LOW_SEC"){
        return oreItem.securityLevel < 0.5
      }
      else{
        return true;
      }
    })
  }
  if(mineralFilters.length > 0){
    filteredOre = filteredOre.filter(function(oreItem){
    for(var j = 0; j <  mineralFilters.length; j++){
      var mineralFilter = mineralFilters[j]
      for(var i = 0; i < oreItem.reprocessedMinerals.length; i++){
        var reprocess = oreItem.reprocessedMinerals[i]
        if(mineralFilter == reprocess.mineral.id){
          return true;
        }
      }
    }

    return false;
    });

  }




  return filteredOre;
}

const mapStateToProps = (state, ownProps) => {
  return {
    oreList: getVisibleOreList(ownProps.oreList, state)
  }
}

const VisibleTodoList = connect(
  mapStateToProps
)(OreList)

export default VisibleTodoList