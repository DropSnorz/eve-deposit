import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import OreNameSelect from './OreNameSelect.jsx';

class OreFilter extends React.Component {
    propTypes:{
        onNameFilterChange: PropTypes.func,
        onSecurityLevelFilterChange: PropTypes.func
        //nameFilters: array
        //securityLevelFilter : string
    }

    constructor(props) {
        super(props);
        this.handleNameFilterChanges = this.handleNameFilterChanges.bind(this);
    }
  
  handleNameFilterChanges(value){

      this.props.onNameFilterChange(value);
  }

  render() {


    var minerals = this.props.mineralList.map(function (item) {
            return (
                <MineralFilter item={item} />
            );
    }, this);

    return  <div>
    			
                <SecurityFilter securityLevelFilter={this.props.securityLevelFilter} onSecurityLevelFilterChange={this.props.onSecurityLevelFilterChange}/>
		    	<form>
                    <div className="row">
                        <div className="col-md-8">
                            <div className="">
		    		            <OreNameSelect 
                                    oreList={this.props.oreList}
                                    onSelectChange={this.handleNameFilterChanges}
                                    value = {this.props.nameFilters}

                                 />
                            </div>                       
                        </div>
                        <div className="col-md-4">
                            <select className="form-control">
                                <option> Sell Profits </option>
                                <option> Refinery Profits </option>
                            </select>
                        </div>
                    </div>
		    	</form>
                <div className="mt-2">
                    {minerals}
                </div>
    		</div>
    		
  }
}

class SecurityFilter extends React.Component{
        propTypes:{
            onSecurityLevelFilterChange: PropTypes.func
            //securityLevelFilter: stirng

        }
        constructor(props) {
            super(props);
            this.handleClick = this.handleClick.bind(this);

        }

        handleClick(event){
            var target = event.currentTarget;
            event.persist();

            this.props.onSecurityLevelFilterChange(target.getAttribute("data-filter"));
        }


        render(){
        var selected = this.props.securityLevelFilter;
        return  <div className="text-center mb-3">
                    <a className={"btn btn-primary " + (selected!="HIGH_SEC" ? "btn-transparent" : "")} data-filter="HIGH_SEC" onClick={this.handleClick}>High Sec</a>
                    <a className={"btn btn-danger "+ (selected!="LOW_SEC" ? "btn-transparent" : "")} data-filter="LOW_SEC" onClick={this.handleClick}>Low Sec</a>
                    <a className={"btn btn-default "+ (selected!="ALL" ? "btn-transparent" : "")} data-filter="ALL" onClick={this.handleClick}>All</a>
                </div>
    }
}


class MineralFilter extends React.Component{

    constructor(props) {
        super(props);
        this.state = {selected: false};
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e){
            this.setState(prevState => ({
                selected: !prevState.selected
        }));
    }

    render(){
        var mineral = this.props.item;
        var notSelected = "";
        if(!this.state.selected){
            notSelected = "badge-transparent";
        }
        return <span className="mr-2">
                <span className={"badge badge-primary badge-bordered badge-mineral-"+ mineral.id + " " + notSelected } onClick={this.handleClick}>
                    <img className="badge-icon" src={"/media/minerals/icons/" + mineral.id  + ".png"} alt="" />{mineral.name} </span>
                </span>
    }

}


export default OreFilter;