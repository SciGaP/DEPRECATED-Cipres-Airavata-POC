/*
 * MonitoredMap.java
 */
package org.ngbw.sdk.database;


import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;


/**
 * 
 * @author Paul Hoover
 *
 * @param <K>
 * @param <V>
 */
abstract class MonitoredMap<K, V> implements Map<K, V> {

	/**
	 * 
	 */
	private class MapEntry implements Map.Entry<K, V> {

		private final Map.Entry<K, V> m_mapEntry;


		// constructors


		protected MapEntry(Map.Entry<K, V> mapEntry)
		{
			m_mapEntry = mapEntry;
		}


		// public methods


		public K getKey()
		{
			return m_mapEntry.getKey();
		}

		public V getValue()
		{
			return m_mapEntry.getValue();
		}

		public V setValue(V value)
		{
			V oldValue = m_mapEntry.setValue(value);

			addMapSetOp(m_mapEntry.getKey(), oldValue, value);

			return oldValue;
		}

		@Override
		public boolean equals(Object other)
		{
			return m_mapEntry.equals(other);
		}

		@Override
		public int hashCode()
		{
			return m_mapEntry.hashCode();
		}
	}

	/**
	 * 
	 */
	private class EntryIterator implements Iterator<Map.Entry<K, V>> {

		private final Iterator<Map.Entry<K, V>> m_setIter;
		private Map.Entry<K, V> m_currentElement;


		// constructors


		protected EntryIterator(Iterator<Map.Entry<K, V>> setIter)
		{
			m_setIter = setIter;
		}


		// public methods


		public boolean hasNext()
		{
			return m_setIter.hasNext();
		}

		public Map.Entry<K, V> next()
		{
			m_currentElement = m_setIter.next();

			return new MapEntry(m_currentElement);
		}

		public void remove()
		{
			addMapRemoveOp(m_currentElement.getKey());

			m_setIter.remove();
		}
	}

	/**
	 * 
	 */
	private class EntrySet implements Set<Map.Entry<K, V>> {

		private final Set<Map.Entry<K, V>> m_entrySet;


		// constructors


		protected EntrySet(Set<Map.Entry<K, V>> entrySet)
		{
			m_entrySet = entrySet;
		}


		// public methods


		public boolean add(Map.Entry<K, V> o)
		{
			throw new UnsupportedOperationException();
		}

		public boolean addAll(Collection<? extends Map.Entry<K, V>> c)
		{
			throw new UnsupportedOperationException();
		}

		public void clear()
		{
			addMapClearOp();

			m_entrySet.clear();
		}

		public boolean contains(Object o)
		{
			return m_entrySet.contains(o);
		}

		public boolean containsAll(Collection<?> c)
		{
			return m_entrySet.containsAll(c);
		}

		public boolean isEmpty()
		{
			return m_entrySet.isEmpty();
		}

		public Iterator<Map.Entry<K, V>> iterator()
		{
			return new EntryIterator(m_entrySet.iterator());
		}

		@SuppressWarnings("unchecked")
		public boolean remove(Object o)
		{
			if (m_entrySet.remove(o)) {
				addMapRemoveOp(((Map.Entry<K, V>) o).getKey());

				return true;
			}

			return false;
		}

		public boolean removeAll(Collection<?> c)
		{
			boolean changed = false;

			for (Iterator<?> removed = c.iterator() ; removed.hasNext() ; )
				changed = remove(removed.next());

			return changed;
		}

		public boolean retainAll(Collection<?> c)
		{
			boolean changed = false;

			for (Iterator<Map.Entry<K, V>> entries = m_entrySet.iterator() ; entries.hasNext() ; ) {
				Map.Entry<K, V> entry = entries.next();

				if (!c.contains(entry)) {
					remove(entry);

					changed = true;
				}
			}

			return changed;
		}

		public int size()
		{
			return m_entrySet.size();
		}

		public Object[] toArray()
		{
			return m_entrySet.toArray();
		}

		public <T> T[] toArray(T[] a)
		{
			return m_entrySet.toArray(a);
		}

		@Override
		public boolean equals(Object other)
		{
			return m_entrySet.equals(other);
		}

		@Override
		public int hashCode()
		{
			return m_entrySet.hashCode();
		}
	}

	/**
	 * 
	 */
	private class KeyIterator implements Iterator<K> {

		private final Iterator<K> m_keyIter;
		private K m_currentElement;


		// constructors


		protected KeyIterator(Iterator<K> keyIter)
		{
			m_keyIter = keyIter;
		}


		// public methods


		public boolean hasNext()
		{
			return m_keyIter.hasNext();
		}

		public K next()
		{
			m_currentElement = m_keyIter.next();

			return m_currentElement;
		}

		public void remove()
		{
			addMapRemoveOp(m_currentElement);

			m_keyIter.remove();
		}
	}

	/**
	 * 
	 */
	private class KeySet implements Set<K> {

		private final Set<K> m_keySet;


		// constructors


		protected KeySet(Set<K> keySet)
		{
			m_keySet = keySet;
		}


		// public methods


		public boolean add(K o)
		{
			throw new UnsupportedOperationException();
		}

		public boolean addAll(Collection<? extends K> c)
		{
			throw new UnsupportedOperationException();
		}

		public void clear()
		{
			addMapClearOp();

			m_keySet.clear();
		}

		public boolean contains(Object o)
		{
			return m_keySet.contains(o);
		}

		public boolean containsAll(Collection<?> c)
		{
			return m_keySet.containsAll(c);
		}

		public boolean isEmpty()
		{
			return m_keySet.isEmpty();
		}

		public Iterator<K> iterator()
		{
			return new KeyIterator(m_keySet.iterator());
		}

		@SuppressWarnings("unchecked")
		public boolean remove(Object o)
		{
			if (m_keySet.remove(o)) {
				addMapRemoveOp((K) o);

				return true;
			}

			return false;
		}

		public boolean removeAll(Collection<?> c)
		{
			boolean changed = false;

			for (Iterator<?> removed = c.iterator() ; removed.hasNext() ; )
				changed = remove(removed.next());

			return changed;
		}

		public boolean retainAll(Collection<?> c)
		{
			boolean changed = false;

			for (Iterator<K> keys = m_keySet.iterator() ; keys.hasNext() ; ) {
				K key = keys.next();

				if (!c.contains(key)) {
					remove(key);

					changed = true;
				}
			}

			return changed;
		}

		public int size()
		{
			return m_keySet.size();
		}

		public Object[] toArray()
		{
			return m_keySet.toArray();
		}

		public <T> T[] toArray(T[] a)
		{
			return m_keySet.toArray(a);
		}

		@Override
		public boolean equals(Object other)
		{
			return m_keySet.equals(other);
		}

		@Override
		public int hashCode()
		{
			return m_keySet.hashCode();
		}
	}

	/**
	 * 
	 */
	private class ValueIterator implements Iterator<V> {

		private final Iterator<Map.Entry<K, V>> m_entryIter;
		private Map.Entry<K, V> m_currentElement;


		// constructors


		protected ValueIterator(Iterator<Map.Entry<K, V>> entryIter)
		{
			m_entryIter = entryIter;
		}


		// public methods


		public boolean hasNext()
		{
			return m_entryIter.hasNext();
		}

		public V next()
		{
			m_currentElement = m_entryIter.next();

			return m_currentElement.getValue();
		}

		public void remove()
		{
			addMapRemoveOp(m_currentElement.getKey());

			m_entryIter.remove();
		}
	}

	/**
	 * 
	 */
	private class ValueCollection implements Collection<V> {

		private final Set<Map.Entry<K, V>> m_entrySet;


		// constructors


		protected ValueCollection(Set<Map.Entry<K, V>> entrySet)
		{
			m_entrySet = entrySet;
		}


		// public methods


		public boolean add(V o)
		{
			throw new UnsupportedOperationException();
		}

		public boolean addAll(Collection<? extends V> c)
		{
			throw new UnsupportedOperationException();
		}

		public void clear()
		{
			addMapClearOp();

			m_entrySet.clear();
		}

		public boolean contains(Object o)
		{
			return m_map.containsValue(o);
		}

		public boolean containsAll(Collection<?> c)
		{
			for (Iterator<?> values = c.iterator() ; values.hasNext() ; ) {
				if (!m_map.containsValue(values.next()))
					return false;
			}

			return true;
		}

		public boolean isEmpty()
		{
			return m_entrySet.isEmpty();
		}

		public Iterator<V> iterator()
		{
			return new ValueIterator(m_entrySet.iterator());
		}

		public boolean remove(Object o)
		{
			for (Iterator<Map.Entry<K, V>> entries = m_entrySet.iterator() ; entries.hasNext() ; ) {
				Map.Entry<K, V> entry = entries.next();

				if (entry.getValue().equals(o)) {
					addMapRemoveOp(entry.getKey());

					entries.remove();

					return true;
				}
			}

			return false;
		}

		public boolean removeAll(Collection<?> c)
		{
			boolean changed = false;

			for (Iterator<Map.Entry<K, V>> entries = m_entrySet.iterator() ; entries.hasNext() ; ) {
				Map.Entry<K, V> entry = entries.next();

				if (c.contains(entry.getValue())) {
					addMapRemoveOp(entry.getKey());

					entries.remove();

					changed = true;
				}
			}

			return changed;
		}

		public boolean retainAll(Collection<?> c)
		{
			boolean changed = false;

			for (Iterator<Map.Entry<K, V>> entries = m_entrySet.iterator() ; entries.hasNext() ; ) {
				Map.Entry<K, V> entry = entries.next();

				if (!c.contains(entry.getValue())) {
					addMapRemoveOp(entry.getKey());

					entries.remove();

					changed = true;
				}
			}

			return changed;
		}

		public int size()
		{
			return m_entrySet.size();
		}

		public Object[] toArray()
		{
			return m_map.values().toArray();
		}

		public <T> T[] toArray(T[] a)
		{
			return m_map.values().toArray(a);
		}

		@Override
		public boolean equals(Object other)
		{
			return m_entrySet.equals(other);
		}

		@Override
		public int hashCode()
		{
			return m_entrySet.hashCode();
		}
	}


	private final Map<K, V> m_map;


	// constructors


	MonitoredMap(Map<K, V> map)
	{
		m_map = map;
	}


	// public methods


	public void clear()
	{
		addMapClearOp();

		m_map.clear();
	}

	public boolean containsKey(Object key)
	{
		return m_map.containsKey(key);
	}

	public boolean containsValue(Object value)
	{
		return m_map.containsValue(value);
	}

	public Set<Map.Entry<K, V>> entrySet()
	{
		return new EntrySet(m_map.entrySet());
	}

	public V get(Object key)
	{
		return m_map.get(key);
	}

	public boolean isEmpty()
	{
		return m_map.isEmpty();
	}

	public Set<K> keySet()
	{
		return new KeySet(m_map.keySet());
	}

	public V put(K key, V value)
	{
		boolean mapped = m_map.containsKey(key);
		V oldValue = m_map.put(key, value);

		if (mapped)
			addMapSetOp(key, oldValue, value);
		else
			addMapPutOp(key, value);

		return oldValue;
	}

	public void putAll(Map<? extends K, ? extends V> t)
	{
		Set<? extends K> keySet = t.keySet();

		for (Iterator<? extends K> keys = keySet.iterator() ; keys.hasNext() ; ) {
			K key = keys.next();

			put(key, t.get(key));
		}
	}

	@SuppressWarnings("unchecked")
	public V remove(Object key)
	{
		if (m_map.containsKey(key))
			addMapRemoveOp((K) key);

		return m_map.remove(key);
	}

	public int size()
	{
		return m_map.size();
	}

	public Collection<V> values()
	{
		return new ValueCollection(m_map.entrySet());
	}

	@Override
	public boolean equals(Object other)
	{
		return m_map.equals(other);
	}

	@Override
	public int hashCode()
	{
		return m_map.hashCode();
	}


	// protected methods


	protected abstract void addMapPutOp(K key, V value);

	protected abstract void addMapSetOp(K key, V oldValue, V newValue);

	protected abstract void addMapRemoveOp(K key);

	protected abstract void addMapClearOp();
}
