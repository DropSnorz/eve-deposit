import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';


export default class OreItem extends React.Component {

  propTypes:{
    item: PropTypes.object,
    secondaryOres: PropTypes.array
  }
  render() {
  	var item = this.props.item;
  	var secondaryOres = this.props.item.secondaryOres;
  	var secondaryOresDisplay = secondaryOres.map(function (item) {

      var price = parseFloat(item.normalizedPrice);
      if(price == 0){
        price = "--";
      } 
      else{
        price = formatFloatPrice(price);
      }

		return (
			<div key={item.id} className="small">
			 <span>{item.name} <span className="float-right text-success">{price} ISK</span></span>
			</div>
			);
		}, this);

    var mineralDisplay = <div></div>;
    var materialDisplay = <div></div>;

    var mineralList = item.reprocessedMinerals.filter(item => item.mineral.type != 2);
    var materialList = item.reprocessedMinerals.filter(item => item.mineral.type == 2);


    if(mineralList.length > 0){
      var mineralBadges = mineralList.map(function(item){
          return <MineralDisplay key={item.id} value={item.reprocessingEfficiency} item = {item.mineral} reprocessingStats={this.props.reprocessingStats} />
      }, this)

      mineralDisplay = <div><i className="fa fa-recycle fa-lg"></i> - {mineralBadges}</div>
    }

    if(materialList.length > 0){
      var materialBadges = materialList.map(function(item){
          return <MaterialDisplay key={item.id} value={item.reprocessingEfficiency} item = {item.mineral} reprocessingStats={this.props.reprocessingStats} />
      }, this)

      materialDisplay = <div><i className="fa fa-flask fa-lg"></i> - {materialBadges}</div>

    }
  	
    var price = parseFloat(item.normalizedPrice);
    if(parseInt(price) == 0){
      price = "--";
    }
    else{
      price = formatFloatPrice(price);
    }

    var specialIcon;
    var specialClass = "";

    if(item.special){
      specialIcon = <span className="ml-1"><i className="fa fa-exclamation-circle" data-toggle="tooltip" data-placement="right" title="Special Ore"></i></span>;
      specialClass = "special-ore-row";
    }

    var iconDisplay;

    if(item.category != null){
      iconDisplay = <small title={item.category}>{item.category.substring(0,2)}</small>
    }
    else{
      iconDisplay = <SecurityLevelDisplay value={item.securityLevel} />
    }

    return 	<div className="">
    			<div className={"ore-row "+ specialClass}>
		    		<div className="media">
		    			<span className="">
                <div>{iconDisplay}</div>
              </span>
		    			<img className="d-flex mr-2" src={"/media/ore/icons/" + item.graphicId + ".png"} alt="" />
			    		<div className="media-body">
			    			<strong>
			    				{item.name} {specialIcon} <span className="float-right text-success">{price} ISK</span>
			    			</strong>
			    			<div>
			    				{secondaryOresDisplay}
			    			</div>
			    		</div>
		    		</div>
            <div className="ml-5 small text-disabled">
               | <i className="fa fa-rocket ml-1"></i> {item.unitVolume} m3 | <a target="_blank" href={"https://evemarketer.com/regions/10000002/types/" + item.ref} > <i className="fa fa-line-chart ml-1"></i> View on Eve Marketer</a>
            </div>
		    			{mineralDisplay}
              {materialDisplay}
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
    reprocessingStats: PropTypes.array
  }

  render(){
    var max = this.props.reprocessingStats[this.props.item.id - 1]["1"];
    var min = this.props.reprocessingStats[this.props.item.id - 1]["2"];

    var average = 1
    if(max-min != 0) average = (this.props.value - min) / (max-min);
    if(average < 0.3) average = 0.3;

  	return <span className={"badge badge-primary badge-labeled mr-1 badge-mineral-" + this.props.item.id} style={{opacity: average}} >
  		<img className="badge-icon" src={"/media/minerals/icons/" + this.props.item.ref + ".png"} alt="" /> 
  		{this.props.item.name} <i>{this.props.value}</i>
  	</span>

  }
}


class MaterialDisplay extends React.Component{
  propTypes: {
    item: PropTypes.object,
    value: PropTypes.float,
    reprocessingStats: PropTypes.array
  }

  render(){
    var max = this.props.reprocessingStats[this.props.item.id - 1]["1"];
    var min = this.props.reprocessingStats[this.props.item.id - 1]["2"];

    var average = 1
    if(max-min != 0) average = (this.props.value - min) / (max-min);
    if(average < 0.3) average = 0.3;

    return <span className={"mr-1" + this.props.item.id} style={{opacity: average}} data-toggle="tooltip" data-placement="top" title={this.props.item.name}>
      <img className="" src={"/media/minerals/icons/" + this.props.item.ref + ".png"} alt="" /> 
      <i className="small">{this.props.value}</i>
    </span>

  }
}