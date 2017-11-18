import React from 'react';
import OreList from '../components/OreList.jsx';
import VisibleOreList from '../containers/VisibleOreList.js';
import Filter from '../containers/Filter.js';
import {Tabs, Tab} from 'react-bootstrap-tabs';



class OreComparator extends React.Component {
  propTypes:{
        onTypeFilterChange: PropTypes.func
  }
  constructor(props) {
        super(props);
        this.onTabSelect = this.onTabSelect.bind(this);
  }
  onTabSelect(index, label){
    this.props.onTypeFilterChange(index + 1);
  }
     htmlDecode(input){
    var e = document.createElement('div');
    e.innerHTML = input;
    return e.childNodes.length === 0 ? "" : e.childNodes[0].nodeValue;
  }
  render() {
    var selectedTab = this.props.oreTypeFilter - 1;
    return 	<div>
                <div className="mb-2">
                    <Tabs onSelect={this.onTabSelect} selected={selectedTab}>
                        <Tab label="Ore"></Tab>
                        <Tab label="Ice"></Tab>
                        <Tab label="Fullerenes"></Tab>
                    </Tabs>
                </div>
    			<div className="ore-filters">
    				<Filter mineralList = {this.props.mineralList} oreList={this.props.oreList} />
    			</div>

    			<div>
    				<VisibleOreList oreList={this.props.oreList} reprocessingStats={this.props.reprocessingStats} />
    			</div>

    		</div>
  }
}

export default OreComparator