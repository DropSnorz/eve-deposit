import React from 'react';
import ReactDOM from 'react-dom';
import OreItem from './oreItem.jsx';

export default class OreList extends React.Component {

  render() {

  	var oreList = this.props.oreList;
  	var list = oreList.map(function (item) {
				return (
					<OreItem
						name={item.name}
						price={item.price} />
				);
		}, this);

    return <div className="ore-list">
      	{list}
      </div>
    
  }
}
