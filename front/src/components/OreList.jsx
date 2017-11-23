import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import OreItem from './OreItem.jsx';

export default class OreList extends React.Component {

  propTypes:{
    oreList: PropTypes.array
  }
  render() {

  	var oreList = this.props.oreList;
  	var list = oreList.map(function (item) {
				return (
					<OreItem
						key={item.id} item={item} reprocessingStats={reprocessingStats} />
				);
		}, this);

    if(oreList.length == 0){
      list = <p className=" text-center text-muted">- There is no ore matching your filters -</p>
    }

    return (
      <div>
       <span className="float-right"><small data-toggle="tooltip" data-placement="left" title="Prices pulled from Jita market after daily maintenance" id="price-info">Ore price (10m3) <i className="fa fa-sort-desc"></i></small></span>
        <hr />
        <div className="ore-list mt-4">
        	{list}
        </div>
      </div>
      )
    
  }
}
