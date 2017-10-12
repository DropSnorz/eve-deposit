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

  	var mineralDisplay = item.reprocessedMinerals.map(function(item){
  		return <MineralDisplay value={item.reprocessingEfficiency} item = {item.mineral} />
  	}, this)

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
		    		<div>
		    			<i className="fa fa-recycle fa-lg"></i> - {mineralDisplay}
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


class MineralDisplay extends React.Component{
	propTypes: {
		item: PropTypes.object,
        value: PropTypes.float,
    }

    render(){
    	return <span className={"badge badge-primary badge-labeled mr-1 badge-mineral-" + this.props.item.id}>
    		<img className="badge-icon" src={"/media/minerals/icons/" + this.props.item.id + ".png"} alt="" /> 
    		{this.props.item.name} <i>{this.props.value}</i>
    	</span>

    }
}