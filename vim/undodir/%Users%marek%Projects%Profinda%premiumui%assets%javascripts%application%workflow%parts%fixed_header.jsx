Vim�UnDo� �gB	W�����#��7|S/IѽHc�   x                                   bJй     _�                              ����                                                                                                                                                                                                                                                                                                                                                             bJи     �               x   $import classNames from "classnames";   +import AppContext from "PFApp/app_context";   3import PageTabs from "PFComponents/page/page_tabs";   #import PropTypes from "prop-types";   Pimport React, { useContext, useEffect, useMemo, useRef, useState } from "react";   .import { useHistory } from "react-router-dom";   0import { underscored } from "underscore.string";       %import CreateBar from "./create_bar";   -import css from "./fixed_header.module.scss";   )import ListHeaders from "./list_headers";   )import MetadataBar from "./metadata_bar";       const FixedHeader = ({     tab,     changeTab,     isScrolled,     data,     showGanttToggle,     showRolesGantt,     setShowRolesGantt,     showEngagementsProgress,     setShowEngagementsProgress,     handleOrderChange,     handleFilterChange,     handleFiltersReset,     noFiltersSelected,     noOrderSelected,     isRoleEnabled,     isEngagementEnabled,     isPlannerEnabled   }) => {     const history = useHistory();   9  const [headerHeight, setHeaderHeight] = useState(null);         const headerRef = useRef();       "  const handleClick = (value) => {   7    history.push(`/workflow/${underscored(value.id)}`);       changeTab(value.id);     };       	  const {   1    appLayout: { mainRight, mainLeft, mainWidth }   #  } = useContext(AppContext).store;         const tabs = useMemo(() => {       const tabs = [];   [    isEngagementEnabled && tabs.push({ id: "engagements", displayElement: "Engagements" });   I    isRoleEnabled && tabs.push({ id: "roles", displayElement: "Roles" });   P    isPlannerEnabled && tabs.push({ id: "planner", displayElement: "Planner" });       return tabs;     }, [isPlannerEnabled]);         const noListHeaders =   *    (showRolesGantt && tab === "roles") ||   9    (showEngagementsProgress && tab === "engagements") ||       tab === "planner";       "  const isFixed = mainWidth > 800;         useEffect(() => {   P    setHeaderHeight(headerRef.current.offsetHeight - 75); // subtracting padding   f  }, [headerRef.current, tab, showRolesGantt, showEngagementsProgress, mainWidth, data.meta.filters]);       
  return (   Y    <div className={css.headerWrapper} style={isFixed ? { height: headerHeight } : null}>   
      <div           ref={headerRef}   i        className={classNames(css.fixedHeader, { [css.isFixed]: isFixed, [css.isScrolled]: isScrolled })}   4        style={{ left: mainLeft, right: mainRight }}         >   '        <CreateBar compact={isFixed} />   e        <PageTabs items={tabs} active={tab} handleClick={handleClick} rootClassName={css.pageTabs} />           <MetadataBar             tab={tab}             meta={data.meta}   "          isLoading={data.loading}   +          showGanttToggle={showGanttToggle}   )          showRolesGantt={showRolesGantt}   /          setShowRolesGantt={setShowRolesGantt}   ;          showEngagementsProgress={showEngagementsProgress}   A          setShowEngagementsProgress={setShowEngagementsProgress}   +          onOrderChange={handleOrderChange}   -          onFilterChange={handleFilterChange}   -          onFiltersReset={handleFiltersReset}   /          noFiltersSelected={noFiltersSelected}   +          noOrderSelected={noOrderSelected}   
        />   5        {!noListHeaders && <ListHeaders tab={tab} />}         </div>   
    </div>     );   };       FixedHeader.propTypes = {     data: PropTypes.shape({   (    entries: PropTypes.array.isRequired,   &    meta: PropTypes.object.isRequired,   &    loading: PropTypes.bool.isRequired     }).isRequired,   #  tab: PropTypes.string.isRequired,   '  changeTab: PropTypes.func.isRequired,     isScrolled: PropTypes.bool,   ,  showRolesGantt: PropTypes.bool.isRequired,   -  showGanttToggle: PropTypes.bool.isRequired,   /  setShowRolesGantt: PropTypes.func.isRequired,   5  showEngagementsProgress: PropTypes.bool.isRequired,   8  setShowEngagementsProgress: PropTypes.func.isRequired,   /  handleOrderChange: PropTypes.func.isRequired,   0  handleFilterChange: PropTypes.func.isRequired,   0  handleFiltersReset: PropTypes.func.isRequired,   /  noFiltersSelected: PropTypes.bool.isRequired,   -  noOrderSelected: PropTypes.bool.isRequired,   +  isRoleEnabled: PropTypes.bool.isRequired,   1  isEngagementEnabled: PropTypes.bool.isRequired,   -  isPlannerEnabled: PropTypes.bool.isRequired   };       export default FixedHeader;5�5��