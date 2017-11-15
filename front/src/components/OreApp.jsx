import React from 'react';
import OreComparator from '../components/OreComparator.jsx';
import {Tabs, Tab} from 'react-bootstrap-tabs';

class OreApp extends React.Component {
  render() {
    return 	<div>
    			<h1>Harvest</h1>
                <div className="mb-2">
                    <Tabs onSelect={(index, label) => console.log(label + ' selected')}>
                        <Tab label="Ore"></Tab>
                        <Tab label="Ice"></Tab>
                        <Tab label="Gas"></Tab>
                    </Tabs>
                </div>
    			
                <OreComparator mineralList = {this.props.mineralList} oreList = {this.props.oreList} reprocessingStats={this.props.reprocessingStats} />

    		</div>
  }
}

export default OreApp