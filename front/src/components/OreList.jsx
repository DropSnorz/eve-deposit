import React from 'react';
import ReactDOM from 'react-dom';
import OreItem from './OreItem.jsx';

export default class OreList extends React.Component {

  render() {

  	var oreList = this.props.oreList;
  	var list = oreList.map(function (item) {
				return (
					<OreItem
						item={item} reprocessingStats={reprocessingStats} />
				);
		}, this);

    return <div className="ore-list mt-4">
      	{list}
      </div>
    
  }
}
