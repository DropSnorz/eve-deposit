import React from 'react';
import ReactDOM from 'react-dom';

export default class OreItem extends React.Component {
	
  render() {
  	var item = this.props.item;
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
		    			<span className="d-flex"><SecurityLevelDisplay value={item.securityLevel} /></span>
		    			<img className="d-flex mr-3" src={"/media/ore/icons/" + item.graphicId + ".png"} alt="" />
			    		<div className="media-body">
			    			<strong>
			    				{item.name}<span className="float-right text-success">{item.unitPrice} ISK</span>
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


class SecurityLevelDisplay extends React.Component{
	propTypes: {
        value: PropTypes.float,
    }

    formatFloat(value){
    	return value.toFixed(1);
    }

    render(){
    	var value = this.formatFloat(this.props.value)
    	return <small><span className={"eve-color-security" + value.replace(".", "")}>{value}</span></small>

    }


}