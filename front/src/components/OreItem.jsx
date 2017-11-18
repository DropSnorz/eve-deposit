import React from 'react';
import ReactDOM from 'react-dom';

export default class OreItem extends React.Component {

  render() {
  	var item = this.props.item;
  	var secondaryOres = this.props.item.secondaryOres;
  	var secondaryOresDisplay = secondaryOres.map(function (item) {
      var price = formatFloatPrice(parseFloat(item.normalizedPrice));

		return (
			<div key={item.id} className="small">
			 <span>{item.name} <span className="float-right text-success">{price} ISK</span></span>
			</div>
			);
		}, this);

    var mineralDisplay = <div></div>;

    if(item.reprocessedMinerals.length > 0){
      var mineralBadges = item.reprocessedMinerals.map(function(item){
        return <MineralDisplay key={item.id} value={item.reprocessingEfficiency} item = {item.mineral} reprocessingStats={this.props.reprocessingStats} />
      }, this)

      mineralDisplay = <div><i className="fa fa-recycle fa-lg"></i> - {mineralBadges}</div>

    }
  	
    var price = formatFloatPrice(parseFloat(item.normalizedPrice));


    return 	<div className="">
    			<div className="ore-row">
		    		<div className="media">
		    			<span className="d-flex"><SecurityLevelDisplay value={item.securityLevel} /></span>
		    			<img className="d-flex mr-3" src={"/media/ore/icons/" + item.graphicId + ".png"} alt="" />
			    		<div className="media-body">
			    			<strong>
			    				{item.name}<span className="float-right text-success">{price} ISK</span>
			    			</strong>
			    			<div>
			    				{secondaryOresDisplay}
			    			</div>
			    		</div>
		    		</div>
		    			{mineralDisplay}
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
        //reprocessingStats
    }

    render(){
      var max = this.props.reprocessingStats[this.props.item.id - 1]["1"];
      var min = this.props.reprocessingStats[this.props.item.id - 1]["2"];

      var average = 1
      if(max-min != 0) average = (this.props.value - min) / (max-min);
      if(average < 0.3) average = 0.3;

    	return <span className={"badge badge-primary badge-labeled mr-1 badge-mineral-" + this.props.item.id} style={{opacity: average}} >
    		<img className="badge-icon" src={"/media/minerals/icons/" + this.props.item.id + ".png"} alt="" /> 
    		{this.props.item.name} <i>{this.props.value}</i>
    	</span>

    }
}