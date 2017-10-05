import React from 'react';
import ReactDOM from 'react-dom';

export default class OreItem extends React.Component {
	
  render() {
  	var name = this.props.item.name;
  	var price = this.props.item.unitPrice;
  	var secondaryOres = this.props.item.secondaryOres;
  	var secondaryOresDisplay = secondaryOres.map(function (item) {
		return (
			<div className="small">
			<span>{item.name} <span className="float-right text-success">{item.unitPrice} ISK</span></span>
			</div>
			);
		}, this);

    return 	<div className="">
    			<div className="ore-row">
		    		<div className="media">
		    			<img className="d-flex mr-3" src="/media/ore/icons/default.png" alt="" />
			    		<div className="media-body">
			    			<strong>
			    				{name}<span className="float-right text-success">{price} ISK</span>
			    			</strong>
			    			<div>
			    				{secondaryOresDisplay}
			    			</div>
			    		</div>
		    		</div>
		    	</div>
    		</div>
  }
}

