import * as Uebersicht from 'uebersicht'
import * as DataWidget from './data-widget.jsx'
import * as DataWidgetLoader from './data-widget-loader.jsx'
import * as Icons from '../icons.jsx'
import useWidgetRefresh from '../../hooks/use-widget-refresh'
import * as Settings from '../../settings'
import * as Utils from '../../utils'

export { cpuTempStyles as styles } from '../../styles/components/data/cpuTemp'

const settings = Settings.get()
const { widgets, cpuTempWidgetOptions } = settings
const { cpuTempWidget } = widgets
const { refreshFrequency } = cpuTempWidgetOptions

const DEFAULT_REFRESH_FREQUENCY = 5000
const REFRESH_FREQUENCY = Settings.getRefreshFrequency(refreshFrequency, DEFAULT_REFRESH_FREQUENCY)

export const Widget = () => {
  const [state, setState] = Uebersicht.React.useState()
  const [loading, setLoading] = Uebersicht.React.useState(cpuTempWidget)

  const getCPUTemp = async () => {
    const [temp] = await Promise.all([
      Uebersicht.run(`./simple-bar/lib/scripts/temp.sh`)
    ])
    setState({ temp: Utils.cleanupOutput(temp) })
    setLoading(false)
  }

  useWidgetRefresh(cpuTempWidget, getCPUTemp, REFRESH_FREQUENCY)

  if (loading) return <DataWidgetLoader.Widget className="cpuTemp" />
  if (!state || (!state.temp.length)) return null

  const { temp } = state
  return (
    <DataWidget.Widget classes="cpuTemp" Icon={Icons.Thermostat}>
      {state.temp}
    </DataWidget.Widget>
  )
}

